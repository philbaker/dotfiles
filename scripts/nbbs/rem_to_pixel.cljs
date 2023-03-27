(ns rem-to-pixel)

(defn rem-to-pixel [val]
  (* val 16))

(println (rem-to-pixel (first *command-line-args*)))
