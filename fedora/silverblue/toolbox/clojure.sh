sudo dnf install -y clojure java-latest-openjdk java-latest-openjdk-devel

wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein -O lein

chmod a+x lein && mv lein /usr/bin
