(ns tailwind-colors.class-to-hex
  (:require [tailwind-colors.core :as core]
            [tailwind-colors.utils :as utils]))

(-> (first *command-line-args*)
    (utils/class-to-hex core/project-colors)
    println)

