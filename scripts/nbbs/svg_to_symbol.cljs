(ns svg-to-symbol
  (:require [clojure.string :as str]
            ["node-html-parser" :as html :refer [parse]]
            ["fs" :as fs]
            ["path" :as path]
            ["svgo$default" :refer [optimize]]))

; Command line arguments
(def cmd-line-args (js->clj (.slice js/process.argv 2)))
(def file-name (second cmd-line-args))
(def symbol-id (last cmd-line-args))

; Error handling
(when
  (nil? file-name)
  (println "svg-to-symbol expects an svg file name as the first argument")
  (js/process.exit 1))

(when-not
  (fs/existsSync file-name)
  (println file-name "does not exist")
  (js/process.exit 1))

(when-not
  (= (path/extname file-name) ".svg")
  (println "file must have the extension .svg")
  (js/process.exit 1))

; SVG transformation
(defn svg->symbol 
  ([file]
   (:data (js->clj (optimize file) :keywordize-keys true)))
  ([file id] 
   (let [view-box (.getAttribute (.querySelector (parse file) "svg") "viewBox")
         optimized-svg (:data (js->clj (optimize file) :keywordize-keys true)) 
         contents (str (.querySelectorAll (.-firstChild (parse optimized-svg)) "*"))
         path-self-close (str/replace contents #"></path>" "/>")
         contents-clean (str/replace path-self-close #"," "")]
     (str "<symbol id=\"" id "\" viewBox=\"" view-box "\">" contents-clean "</symbol>"))))

; Output
(def file-contents (str (fs/readFileSync file-name)))
(if (= (count cmd-line-args) 2)
  (println (svg->symbol file-contents))
  (println (svg->symbol file-contents symbol-id)))

(comment
  (def file (str (fs/readFileSync "glasses.svg")))
  (def id "glasses"))
