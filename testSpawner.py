import numpy
import math
import random

spawn_position = 0


def spawner_function(x):
    y = 4 * (x ^ 2) + 1
    return y


def spawner_function_invrt(y):
    x = math.sqrt(abs((y - 1)/4))
    return x


def spawner(current_position):
    y = random.random() * 400
    x = spawner_function_invrt(y)
    spawn_position = int(x)
    return spawn_position


print(spawner(10))
