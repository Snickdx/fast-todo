# Question 4: Configuration & Deployment

For this question you are required to submit **app.conf** and **setup.sh**.

Complete the incomplete sections marked `A(i)`, `A(ii)`, `B(i)`, `B(ii)`, `B(iii)`, and `B(iv)` in those files. Do not change the parts of the files that are already provided.

---

**A.** Update **app.conf**, which contains the Apache configuration, so that it does the following:

- **i.** Serve static assets deployed to `/var/www/html/app` when `http://localhost` is used (set the document root appropriately).
- **ii.** Reverse proxy application traffic to the FastAPI (uvicorn) process on port **5000**, while still allowing Apache to serve files under `/static` from the document root.

**[3 marks]**

---

**B.** With reference to the repository’s instructions in `README.md`, update **setup.sh** so that it does the following:

- **i.** Create a Python virtual environment and install the project dependencies from `requirements.txt`.
- **ii.** Create the SQLite data directory (`data/`) with suitable permissions.
- **iii.** Deploy the app’s `static/` folder to `/var/www/html/app`.
- **iv.** Install/enable the required Apache modules, copy `app.conf` into Apache’s sites configuration, enable the site, and reload Apache.

**[7 marks]**

---

### Notes for students

- After setup, start the FastAPI app with `./run.sh` (listens on `0.0.0.0:5000`).
- Jinja templates are rendered by FastAPI; Apache only hosts static files and reverse-proxies the rest of the site.
- Useful checks: `sudo apache2ctl configtest`, `sudo systemctl status apache2`.
