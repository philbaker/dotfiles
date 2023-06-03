(ns tailwind-colors.hex-to-class
  (:require [tailwind-colors.core :as core]
            [tailwind-colors.utils :as utils]))

(-> (first *command-line-args*)
    (utils/hex-to-class core/project-colors)
    println)
