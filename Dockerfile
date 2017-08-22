FROM techio/maven3-builder:1.4

ENV TECHIO_RUN_DIR /project/answer

COPY run.sh /usr/src/codingame/run.sh

ENTRYPOINT ["/usr/src/codingame/run.sh"]
