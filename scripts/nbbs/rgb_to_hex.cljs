(ns rgb-to-hex
  (:require [cljs.reader :as c]
            [clojure.string :as str]))

(defn rgb-to-hex
  "Converts an RGB code to a hex code"
  [rgb-code]
  (->> rgb-code
       (map #(.toString % 16))
       (map #(if (= (count %) 1) (str "0" %) %))
       (str/join)
       (str "#")))

(-> (c/read-string (first *command-line-args*))
    rgb-to-hex
    println)
