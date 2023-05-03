import math
import random
import typing
import string
import networkx

from classes import *

FILE_START = \
    """
package OOP2.Tests;
import java.util.Iterator;
import junit.framework.Assert;
import org.junit.Test;
import OOP2.Solution.*;
import OOP2.Provided.*;
import java.util.NoSuchElementException;

public class OOP2Tests {
"""

FILE_END = \
    """
}
"""

FUNC_START = \
    """
\t@Test
\tpublic void test%s() {
\t\tFaceOOP poop = new FaceOOPImpl();
"""

FUNC_END = \
    """
\t}
"""

PERSON_COUNT = 5
TEST_COUNT = 50
TEST_LENGTH = 100
SECTION_LENGTH = 100  # unused
people = []
post_id = 0
post_list = []
graph = networkx.Graph()


def add_friend():
    temp_list = [x for x in range(PERSON_COUNT)]
    p1 = temp_list[random.randint(0, len(temp_list) - 1)]
    temp_list = [x for x in range(PERSON_COUNT) if people[x] not in people[p1].friends.values() and x != p1]
    if len(temp_list) == 0:
        return add_like()
    p2 = temp_list[random.randint(0, len(temp_list) - 1)]
    # p1 = random.randint(0, PERSON_COUNT - 1)
    # p2 = random.randint(0, PERSON_COUNT - 1)
    # if p1 == p2:

    # catch_try(f"\t\t\tpoop.addFriendship(p{p1}, p{p2});\n", "Exception", file)
    # file.write(f"\t\t\tpoop.addFriendship(p{p1}, p{p2});\n")
    command = f"\t\t\tpoop.addFriendship(p{p1}, p{p2});\n"
    people[p1].friends[p2] = people[p2]
    people[p2].friends[p1] = people[p1]
    graph.add_edge(p1, p2)
    # command += test_content([people[p1], people[p2]])
    return command


def add_post():
    person_idx = random.randint(0, PERSON_COUNT - 1)
    # person_idx = 0
    content = "".join(random.choices(string.ascii_letters, k=10))
    # catch_try(f"\t\t\tStatus s{len(post_list)} = p{person_idx}.postStatus(\"{content}\");\n", "Exception", file)
    command = f"\t\t\ts{len(post_list)} = p{person_idx}.postStatus(\"{content}\");\n"
    # file.write(f"\t\t\tStatus s{len(post_list)} = p{person_idx}.postStatus(\"{content}\");\n")
    people[person_idx].posts.append(len(post_list))
    post_list.append(Status(content, len(post_list), people[person_idx]))
    return command


def add_people():
    command = ""
    for i in range(PERSON_COUNT): command += f"\t\tPerson p{i} = null;\n"
    init = ""
    for i in range(PERSON_COUNT):
        init += f'\t\t\tp{i} = poop.joinFaceOOP({i}, "{i}");\n'
        # catch_try(f'\t\tp{i} = poop.joinFaceOOP({i}, "{i}");', "PersonAlreadyInSystemException", test)
        people.append(Person(i, str(i)))
        graph.add_node(i)
    command += catch_try(init, "Exception")
    return command
    # catch_try(command, "Exception", test)


def test_content(people_list: list[Person]) -> str:
    # recent check
    command = ""
    for person in people_list:
        command += f"\t\t\tit = poop.getFeedByRecent(p{person.id});\n"
        for friend in sorted(person.friends.keys()):
            for post_idx in reversed(people[friend].posts):
                command += f"\t\t\tAssert.assertEquals(it.next(), s{post_idx});\n"

        command += f"\t\t\tit = poop.getFeedByPopular(p{person.id});\n"
        for friend in sorted(person.friends.keys()):
            friend_posts = [post_list[post] for post in people[friend].posts]
            for post in sorted(friend_posts, key=lambda x: -len(x.likes)):
                # for post_idx in sorted(people[friend].posts, key=lambda x: post_list[post_idx].likes):
                command += f"\t\t\tAssert.assertEquals(it.next(), s{post.id});\n"
        command += "\n"
        # catch_try(command, "Exception", file)
        # file.write(command)
    command += test_bfs()
    return command

    """
    for p in people_list:
        command = ""
        command += f"\t\t\tit = poop.getFeedByRecent(p{p.id});\n"
        for friend in sorted(p.friends.keys()):
            for post_idx in p.friends[friend].posts:
                command += f"\t\t\tAssert.assertEquals(it.next(), new StatusImpl(p{p.friends[friend].id}, \"f\", {post_list[post_idx].id}));\n"
        catch_try(command, "Exception", file)

        command = ""
        command += f"\t\t\tit = poop.getFeedByPopular(p{p.id});\n"
        posts = []
        for friend in p.friends.keys():
            for post_idx in p.friends[friend].posts:
                posts.append(post_list[post_idx])
        sorted(posts, key=lambda x: len(x.likes))
        for post_idx in posts:
            command += f"\t\t\tAssert.assertEquals(it.next(), new StatusImpl(p{post_idx.publisher.id}, \"f\", {post_idx.id}));\n"
        catch_try(command, "Exception", file)
    """


def add_like() -> str:
    if len(post_list) == 0: return add_post()
    s1 = random.randint(0, len(post_list) - 1)
    p1 = random.randint(0, PERSON_COUNT - 1)
    post_list[s1].likes.add(people[p1])
    command = f"\t\t\ts{s1}.like(p{p1});\n"
    # command += test_content([people[p1]])
    return command


def catch_try(code, exception):
    return "\t\ttry {\n" + code + "\t\t} catch (" + exception + " e) { System.out.println(e.getMessage()); Assert.fail(); }\n"
    # file.write("\t\ttry {\n" + code + "\t\t} catch (" + exception + " e) { Assert.fail(); }\n")


def test_bfs():
    command = ""
    for i in range(PERSON_COUNT):
        result = dict(networkx.single_source_shortest_path(graph, i))
        result.pop(i)
        if len(result) == 0:
            continue
        search_node = random.choice(list(result.keys()))
        path_length = len(result[search_node]) - 1
        command += f"\t\t\tAssert.assertEquals((int)poop.rank(p{i}, p{search_node}), {path_length});\n"
    return command



def main():
    global people, post_list, graph
    # print(FUNC_START % 1)
    test = open('OOP2Tests.java', 'w')
    test.write(FILE_START)
    for test_num in range(TEST_COUNT):
        people = []
        post_list = []
        graph = networkx.Graph()
        test.write(FUNC_START % str(test_num + 1))
        test.write(add_people())
        test.write("\t\tIterator<Status> it;\n")
        # command += add_post()
        # command += add_friend()
        # command += add_like()
        # command += test_content([p for p in people])
        # test.write(catch_try(command, "Exception"))
        commands = []
        command = ""
        for i in range(TEST_LENGTH):

            # while command.count('\n') < SECTION_LENGTH:
            # for i in range(SECTION_LENGTH):
            option = random.randint(1, 3)
            if i % 10 == 9:
                command += test_content([p for p in people])
            elif option == 1:
                command += add_post()
            elif option == 2:
                command += add_like()
            elif option == 3:
                command += add_friend()
            else:
                print("what")

            # commands.append(catch_try(command, "Exception"))

        post_dec = ""
        for i in range(len(post_list)):
            post_dec += f"\t\tStatus s{i} = null;\n"

        test.write(post_dec)
        test.write(catch_try(command, "Exception"))
        # for command in commands:
        #   test.write(command)
        test_bfs()
        test.write(FUNC_END)

    # test.write(catch_try(command, "Exception"))
    test.write(FILE_END)
    test.close()


if __name__ == '__main__':
    main()
