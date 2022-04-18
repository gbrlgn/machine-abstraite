toolbox create clojure
toolbox run -c clojure default.sh
toolbox run -c clojure clojure.sh

toolbox create rust
toolbox run -c rust default.sh
toolbox run -c rust rust.sh

toolbox create go
toolbox run -c go default.sh
toolbox run -c go go.sh

toolbox create node
toolbox run -c node default.sh
toolbox run -c node node.sh
