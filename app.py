#!/usr/bin/env python3
from tornado.web import Application, RequestHandler
from tornado.ioloop import IOLoop

def main():
    import logging
    db = initdb()
    app = Application([
        (r"/s/(.+)", SearchHandler, dict(db=db)),
    ])
    app.listen(8888)
    logging.info("will listen 8888")
    IOLoop.current().start()

class DB(object):
    def __init__(self, entries = None):
        self.entries = [] if entries is None else entries
    def search(self, query_string):
        """
        >>> DB([(1, "", "tour city",), (2, "", "some other",)]).search("city tour")
        [(1, '', 'tour city')]
        """
        terms = query_string.split()
        result = []
        for e in self.entries:
            target = len(terms)
            for t in terms:
                if t in e[2]:
                    target -= 1
            if target == 0:
                result.append(e)
        return result
    def add(self, entry):
        "An entry is a tuple of (id, datatime, text)."
        self.entries.append(entry)

def initdb(filename="data.json"):
    import json
    db = DB()
    with open(filename, "r") as f:
        for l in f:
            q_dict = json.loads(l)
            for e in q_dict["data"]:
                db.add((e['review_id'], e['date'], e['message']))
    return db

class SearchHandler(RequestHandler):
    def initialize(self, db):
        self.db = db
    def get(self, query_string):
        r = self.db.search(query_string)
        self.write(dict(
            size = len(r),
            entries = r
        ))

if __name__ == "__main__":
    main()
