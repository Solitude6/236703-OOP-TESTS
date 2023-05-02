import random
import typing
import string

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
\t@Test
\tpublic void test() {
\t\tFaceOOP poop = new FaceOOPImpl();
"""

FILE_END = \
"""
\t}
}
"""

PERSON_COUNT = 5
TEST_LENGTH = 100
people = []
post_id = 0
post_list = []


def add_friend(file):
    p1 = random.randint(0, PERSON_COUNT - 1)
    p2 = random.randint(0, PERSON_COUNT - 1)
    catch_try(f"\t\t\tpoop.addFriendship(p{p1}, p{p2});\n", "Exception", file)
    test_content([people[p1], people[p2]], file)


def add_post(file):
    person_idx = random.randint(0, PERSON_COUNT - 1)
    content = "".join(random.choices(string.ascii_letters, k=10))
    catch_try(f"\t\t\tStatus s{len(post_list)} = p{person_idx}.postStatus(\"{content}\");\n", "Exception", file)
    people[person_idx].posts.append(len(post_list))
    post_list.append(Status(content, len(post_list), people[person_idx]))


def test_content(people_list : list[Person], file):
    # recent check
    for person in people_list:
        command = ""
        command += f"\t\t\tit = poop.getFeedByRecent(p{person.id});\n"
        posts = []
        for friend in sorted(person.friends.keys()):
            for post_idx in reversed(people[friend].posts):
                command += f"\t\t\tAssert.assertEquals(it.next(), s{post_idx}"
                #posts.append(post_list[post_idx])

        for friend in sorted(person.friends.keys()):
            for post_idx in sorted(people[friend].posts, key=lambda x: post_list[post_idx].likes):
                command += f"\t\t\tAssert.assertEquals(it.next(), s{post_idx}"

        catch_try(command, "Exception", file)

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


def catch_try(code, exception, file):
    file.write("\t\ttry {\n" + code + "\t\t} catch (" + exception + " e) { Assert.fail(); }\n")


def main():
    test = open('OOP2Tests.java', 'w')
    test.write(FILE_START)
    for i in range(PERSON_COUNT): test.write(f"\t\tPerson p{i} = null;\n")
    command = ""
    for i in range(PERSON_COUNT):
        command += f'\t\tp{i} = poop.joinFaceOOP({i}, "{i}");\n'
        #catch_try(f'\t\tp{i} = poop.joinFaceOOP({i}, "{i}");', "PersonAlreadyInSystemException", test)
        people.append(Person(i, str(i)))
    catch_try(command, "Exception", test)
    test.write("\t\tIterator<Status> it;\n")
    add_post(test)
    add_friend(test)
    test_content([p for p in people], test)
    """
    for i in range(TEST_LENGTH):
        test_content([people[0], people[1]], test)
        option = random.randint(1, 1)
        """
    test.write(FILE_END)
    test.close()


if __name__ == '__main__':
    main()
