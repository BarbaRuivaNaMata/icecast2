import docker

client = docker.from_env()

containers = client.containers.list(all=True)

for container in containers:
    print(f"Parando e removendo o contêiner {container.id}")
    container.stop()
    container.remove()

print("Todos os contêineres foram removidos.")