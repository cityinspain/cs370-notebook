# Olive Salamanca - SNHU CS370 Jupyter Notebook

I had a lot of trouble using Apporto for CS370, but the examples in the course textbook that we're meant to follow
are for an older version of Tensorflow/Keras, so running it local Docker wasn't as simple as if they were current.

So, what I've done is gone in and figured out the versions for each of the packages we use, and built a Docker image
with those specific versions. So far, this has worked identically to how Apporto would work.

## Building

`docker build -t cs370-jupyter:latest .`

## Running

`docker run -p 8888:8888 -v $(pwd):/workspace cs370-jupyter:latest`

## Versions

| Package                 | Version |
|-------------------------|---------|
| Tensorflow              | 2.1.0   |
| Keras                   | 2.3.1   |
| Matplotlib              | 3.1.1   |
| Protobuf<sup>1</sup>    | 3.20.*  |

---

1. Protobuf is pinned due to an error I recieved running a fairly basic example: `_message.Message._CheckCalledFromGeneratedFile() TypeError: Descriptors cannot not be created directly.`. [Relevant StackOverflow question](https://stackoverflow.com/questions/72441758/typeerror-descriptors-cannot-not-be-created-directly). Pinning Protobuf here solved the problem.
