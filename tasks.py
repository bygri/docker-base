import os

from invoke import task

@task
def build(c):
  """Build and push all Dockerfiles."""
  base_repo = 'tobygriffin/base'
  for (dirpath, _, filenames) in os.walk('.'):
    for file in (x for x in filenames if x.endswith('.dockerfile')):
      repo = base_repo + dirpath[1:].replace('/', '-')
      tag = file[:-11]
      cmd = ('docker buildx build --platform "linux/amd64,linux/arm64" '
             f'--push -t {repo}:{tag} -f {dirpath}/{file} {dirpath}')
      c.run(cmd)
