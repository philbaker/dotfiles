(ns tailwind-colors.utils
  (:require [clojure.string :as str]
            [cljs.reader :as c]))

(defn handle-short-hex 
  "Converts a 3 char hex to the equivalent 6 char version"
  [hex-code]
  (let [hex (rest hex-code)]
    (if (= (count hex) 3) 
      (->> hex
           (map #(repeat 2 %))
           (flatten)
           (str/join)
           (str "#"))
      hex-code)))

(defn hex-to-rgb
  "Converts a hexadecimal color to RGB color"
  [hex-code]
  (let [hex (partition 2 (rest (handle-short-hex hex-code)))
        r (first hex)
        g (second hex)
        b (last hex)]
    (mapv #(-> (conj % "0x") 
               (str/join) 
               (c/read-string)) 
          [r g b])))

(defn rgb-format-css
  "Formats rgb output in CSS rgb() form"
  [rgb-code]
  (str "rgb(" (str/join ", " rgb-code) ")"))

(defn normalize-colors 
  "Turns the nested structure from Tailwind's config into a flat one with 
  color names as keys"
  [coll]
  (reduce (fn [acc [color-name colors]]
            (reduce (fn [acc2 [key val]]
                      (assoc acc2 (->> (str key)
                                       (str color-name "-"))
                             val))
                    acc
                    colors))
          {}
          coll))


(defn bulk-hex-to-rgb 
  "Converts all hex values in a map to rgb"
  [colors]
  (->> colors
       (map (fn [[key val]] [key (-> val 
                                     (hex-to-rgb) 
                                     (rgb-format-css))]))
       (into {})))

(defn key-from-value 
  "Look up a hash map key by value"
  [value coll]
  (first 
    (filter 
      (comp #{value} coll) 
      (keys coll))))

(defn hex-to-class
  "Get class name based on hex value"
  [hex-code data]
  (name (key-from-value hex-code data)))

(defn rgb-to-class
  "Get class name based on rgb value"
  [rgb-code data]
  (name (key-from-value rgb-code data)))

(defn class-to-hex
  "Get hex code based on class name"
  [class-name data]
  ((keyword class-name) data))

(defn class-to-rgb
  "Get rgb code based on class name"
  [class-name data]
  ((keyword class-name) data))
