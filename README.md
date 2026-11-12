# FastAPI Todo (Taskline)

Full-stack todo app served by a single FastAPI process with Jinja2 templates, Tailwind CSS, and SQLite — deployable behind an Apache reverse proxy.

Assignment brief: see [QUESTION.md](QUESTION.md). Instructor solutions live in `solution/`.

## TL;DR

```bash
chmod +x setup.sh run.sh fix-path.sh
# Complete app.conf and setup.sh first (see QUESTION.md), then:
./setup.sh
./run.sh
```

Open [http://localhost/](http://localhost/) via Apache, or hit the app directly at [http://localhost:5000/](http://localhost:5000/).

## Project structure

```
fastapi-todo/
├── main.py              # Routes + Jinja rendering
├── database.py          # SQLAlchemy / SQLite setup
├── models.py            # Todo model
├── templates/           # Jinja2 HTML
├── static/              # CSS and static assets
├── data/                # SQLite database (created at runtime)
├── app.conf             # Apache virtual host (student stub)
├── setup.sh             # Install deps + configure Apache (student stub)
├── run.sh               # Start uvicorn on port 5000
├── QUESTION.md          # Configuration & deployment question
└── solution/            # Completed app.conf and setup.sh
```

## Features

- Server-rendered UI (Jinja2 + Tailwind)
- Create, toggle complete, and delete todos via HTML forms
- SQLite persistence in `data/app.db`
- Apache serves `/static` from `/var/www/html/app` and reverse-proxies the rest to uvicorn

## Routes

| Method | Path | Description |
|--------|------|-------------|
| `GET` | `/` | Todo list page |
| `POST` | `/todos` | Create a todo (`title` form field) |
| `POST` | `/todos/{id}/toggle` | Toggle completed |
| `POST` | `/todos/{id}/delete` | Delete a todo |
| `GET` | `/health` | Health check JSON |

## Python virtual environments (venv)

A **virtual environment** is an isolated Python install for this project only. It keeps the packages in `requirements.txt` (FastAPI, uvicorn, Jinja2, etc.) separate from your system Python and from other projects, so versions do not clash.

| Piece | Role |
|--------|------|
| `python -m venv .venv` | Creates a folder named `.venv` with its own `python` and `pip` |
| `activate` | Puts that folder’s tools first on your `PATH` for the current terminal |
| `pip install -r requirements.txt` | Installs app dependencies **into** `.venv`, not globally |
| `deactivate` | Leaves the venv and returns to system Python |

`setup.sh` and `run.sh` create/use `.venv` the same way on Linux/WSL. You do not commit `.venv` to git (it is listed in `.gitignore`); each machine recreates it locally.

## Local development (Windows / any OS)

```bash
python -m venv .venv
# Windows:
.\.venv\Scripts\activate
# Linux/macOS:
source .venv/bin/activate

pip install -r requirements.txt
uvicorn main:app --reload --port 5000
```

When you are done in that terminal, run `deactivate`.

Open [http://localhost:5000/](http://localhost:5000/).

## Apache deploy notes

When `app.conf` / `setup.sh` are completed correctly:

- Document root: `/var/www/html/app` (static assets)
- `/static` is served by Apache from that document root
- All other traffic is reverse-proxied to `http://127.0.0.1:5000/`
- Start the app with `./run.sh` after setup

Useful checks:

```bash
sudo apache2ctl configtest
sudo systemctl status apache2
sudo systemctl restart apache2
```

## Troubleshooting

**WSL picking Windows Python**

```bash
./fix-path.sh
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
```

**Port 5000 in use**

```bash
lsof -ti:5000 | xargs kill -9
```

**Reset database**

```bash
rm -f data/app.db
```

## License

MIT
