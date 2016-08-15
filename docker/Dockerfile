FROM nlzimmerman/alpine-anaconda3:4.1.11-0
USER root

# Needed for ofxparse and gnucashxml since I'm patching them.
RUN apk add --no-cache git
# It's my personal policy to always speficy complete versions
RUN conda install -y beautifulsoup4=4.4.1
RUN conda install -y lxml=3.6.1
RUN conda install -y six=1.10.0
RUN conda install -y python-dateutil=2.5.3
RUN conda install -y ipython-notebook=4.0.4

RUN mkdir /build
ADD ofxparse.diff /build/
ADD gnucashxml.diff /build

WORKDIR /build
RUN /usr/bin/git clone https://github.com/jseutter/ofxparse
WORKDIR /build/ofxparse
RUN /usr/bin/git checkout 8e2caf69f2fd3201c3f864cf6b195b691e879c0d
RUN /usr/bin/git apply ../ofxparse.diff
RUN python setup.py install

WORKDIR /build
RUN /usr/bin/git clone https://github.com/jorgenschaefer/gnucashxml
WORKDIR /build/gnucashxml
RUN /usr/bin/git checkout 528dfea6bb15e244d4e0eda95e9be281e0fdb5ef
RUN /usr/bin/git apply ../gnucashxml.diff
RUN python setup.py install

RUN mkdir /work

VOLUME [ "/work" ]
WORKDIR /work

EXPOSE 8888

CMD ipython notebook --ip=0.0.0.0
