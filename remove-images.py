import docker

client = docker.from_env()

images = client.images.list()
for image in images:
    try:
        print(f"Removendo a imagem {image.id}")
        client.images.remove(image.id, force=True)
    except docker.errors.APIError as e:
        print(f"Erro ao remover imagem {image.id}: {e}")

print("Todas imagens foram removidas.")
