(ns pixel-to-rem)

(defn pixel-to-rem [val]
  (/ val 16))

(println (pixel-to-rem (first *command-line-args*)))
