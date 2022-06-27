import time
from locust import HttpLocust, HttpUser, TaskSet, User, between, task

class Myuser(User):
    @task
    def task(self):
        print("execute task ")

class MyTask(HttpUser):
    wait_time = between(1,5)
    @task(2)
    def task_1(self):
        self.client.get("http://localhost:8000")

    @task(1)
    def task_2(self):
        self.client.post("http://localhost:8000/predict")
