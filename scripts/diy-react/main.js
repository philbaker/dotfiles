function createElement(node) {
  if (Array.isArray(node)) {
    const [tag, props, children] = node;
    return {
      type: tag,
      props: {
        ...props,
        children: children.map(createElement),
      },
    };
  }

  // primitives like text or number
  return {
    type: "TEXT",
    props: {
      nodeValue: node,
      children: [],
    },
  };
}

function removeDOMElement(prevElement) {
  prevElement.parent.removeChild(prevElement.domElement);
}

function createDOMElement(element) {
  return element.type === "TEXT"
    ? document.createTextNode(element.props.nodeValue)
    : document.createElement(element.type);
}

function setDOMProps(element, domElement, prevElement) {
  if (!domElement) {
    return;
  }

  if (prevElement) {
    Object.keys(prevElement.props)
      .filter((key) => key !== "children")
      .forEach((key) => {
        domElement[key] = ""; // clear prop
      });
  }

  Object.keys(element.props)
    .filter((key) => key !== "children")
    .forEach((key) => {
      domElement[key] = element.props[key];
    });
}

function renderInternal(element, container, prevElement) {
  let domElement, children;

  if (!container) {
    return;
  }

  if (!element && prevElement) {
    removeDOMElement(prevElement);
    return;
  } else if (element && !prevElement) {
    domElement = createDOMElement(element);
  } else if (element.type === prevElement.type) {
    domElement = prevElement.domElement;
  } else {
    removeDOMElement(prevElement);
    domElement = createDOMElement(element);
  }
  setDOMProps(element, domElement, prevElement);
  children = renderChildren(element, domElement, prevElement);

  if (!prevElement || domElement !== prevElement.domElement) {
    container.appendChild(domElement);
  }

  return {
    domElement: domElement,
    parent: container,
    type: element.type,
    props: {
      ...element.props,
      children: children,
    },
  };
}

const renderTrees = {};

function render(element, container) {
  const tree = renderInternal(element, container, renderTrees[container]);
  // render complete, store the updated tree
  renderTrees[container] = tree;
}

function renderChildren(
  element,
  domElement,
  prevElement = { props: { children: [] } }
) {
  const elementLen = element.props.children.length;
  const prevElementLen = element.props.children.length;
  // remove now unused elements
  for (let i = elementLen; i < prevElementLen - elementLen; i++) {
    removeDOMElement(element.props.children[i]);
  }
  // render existing and new elements
  return element.props.children.map((child, i) => {
    const prevChild =
      i < prevElementLen ? prevElement.props.children[i] : undefined;
    return renderInternal(child, domElement, prevChild);
  });
}

const SayNow = ({ dateTime }) => {
  return ["h1", {}, [`It is: ${dateTime}`]];
};

const App = () => {
  return [
    "div",
    { className: "header" },
    [
      SayNow({ dateTime: new Date() }),
      ["input", { type: "submit", disabled: "disabled" }, []],
    ],
  ];
};

setInterval(() => {
  render(createElement(App()), document.getElementById("root"));
}, 1000);
