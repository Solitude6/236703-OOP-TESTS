import typing


class Status:
    def __init__(self, content, id, publisher):
        self.content = content
        self.id = id
        self.publisher = publisher
        self.likes = set()


class Person:
    def __init__(self, id, name):
        self.id = id
        self.name = name
        self.posts = list()
        self.friends = dict()
