(ns tailwind-colors.core
  (:require ["fs" :as fs]
            ["app-root-path$default" :as app-root-path]
            [clojure.walk :as walk]
            [tailwind-colors.utils :as utils]
            [tailwind-colors.colors :as colors]))

; Set up color data
(def custom-colors
  (-> (str app-root-path "/colors.json")
      (fs/readFileSync)
      (str)
      (js/JSON.parse)
      (js->clj)
      (get "colors")))

(def project-colors
  (-> custom-colors
      (utils/normalize-colors)
      (walk/keywordize-keys)
      (merge colors/default-colors)))

(def project-colors-rgb (utils/bulk-hex-to-rgb project-colors))

(defn generate-json 
  "Writes final hex and rgb color hash maps to json objects"
  []
  (let [hex (.stringify js/JSON (clj->js project-colors))
        rgb (.stringify js/JSON (clj->js project-colors-rgb))]
    (do
      (fs/writeFileSync (str app-root-path "/public/assets/hex_colors.json") hex)
      (fs/writeFileSync (str app-root-path "/public/assets/rgb_colors.json") rgb))))

; Command line arguments
(def cmd-line-args (js->clj (.slice js/process.argv 2)))
(def command (first cmd-line-args))
(def color (second cmd-line-args))

; Command line options
(when (and (nil? command) (nil? color))
  (println "two arguments required")
  (js/process.exit 1))

(when (or (= command "hc") (= command "hex-to-class"))
  (println (utils/hex-to-class color project-colors)))

(when (or (= command "rc") (= command "rgb-to-class"))
  (println (utils/rgb-to-class color project-colors-rgb)))

(when (or (= command "ch") (= command "class-to-hex"))
  (println (utils/class-to-hex color project-colors)))

(when (or (= command "cr") (= command "class-to-rgb"))
  (println (utils/class-to-rgb color project-colors-rgb)))

(when (or (= command "gj") (= command "generate-json"))
  (do
    (generate-json)
    (println "hex and rgb codes written to /public/assets")))
