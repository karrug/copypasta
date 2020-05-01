# what is pre-commit?
it executes specified steps on every git commit.


# what is black?
black sets up standards in python coding.
no more arguing on how many spaces to use, signle vs double quotes etc..black decides for us.


# black with pre-commit
On every git commit, pre-commit runs black and refactors the code.

# installation and usage
1. install pre-commit
```python
pip install pre-commit
pre-commit install
```

2. configure pre-commit
create file .pre-commit-config.yaml inside your project with below content.
```yaml
repos:
-   repo: https://github.com/ambv/black
    rev: stable
    hooks:
    - id: black
      language_version: python3.6
```

that's it, whenever git commit is done, it refactors the code.
