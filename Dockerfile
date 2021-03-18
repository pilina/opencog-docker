FROM debian:bullseye-slim

# install dependencies
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y git g++ libboost-all-dev cmake binutils libiberty-dev doxygen

# install cogutil
RUN git clone https://github.com/opencog/cogutil \
    && cd cogutil \
    && git checkout stable \
    && mkdir build && cd build \
    && cmake .. && make -j5 && make -j5 install && ldconfig \
    && cd ../.. && rm -r ./cogutil \
    && echo "Installed CogUtil"

# install atomspace
RUN git clone https://github.com/opencog/atomspace \
    && cd atomspace \
    && mkdir build && cd build \
    && cmake .. && make -j5 && make -j5 install && ldconfig \
    && cd ../.. && rm -r /atomspace \
    && echo "Installed AtomSpace"

# install cogserver
RUN git clone https://github.com/opencog/cogserver \
    && cd cogserver \
    && mkdir build && cd build \
    && cmake .. && make -j5 && make -j5 install && ldconfig \
    && cd ../.. && rm -rf /cogserver \
    && echo "Installed CogServer"

# install attention
RUN git clone https://github.com/opencog/attention \
    && cd attention \
    && mkdir build && cd build \
    && cmake .. && make -j5 && make -j5 install && ldconfig \
    && cd ../.. && rm -rf /attention \
    && echo "Installed Attention"


