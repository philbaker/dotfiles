(ns hex-to-rgb
  (:require [cljs.reader :as c]
            [clojure.string :as str]))

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

(println (rgb-format-css (hex-to-rgb (first *command-line-args*))))
