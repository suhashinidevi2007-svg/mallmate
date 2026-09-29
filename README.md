# MallMate Web Application

MallMate is a Java Servlet & JSP web application for shopping mall floor navigation, shop directories, and product browsing.

---

## 🚀 Quick Setup & Deployment Guide

### 1. Supabase Database Setup

1. Log in to [Supabase](https://supabase.com/) and create a new project (e.g., `mallmate`).
2. Go to **SQL Editor** in the left sidebar.
3. Click **New query**, paste the entire contents of [`database/mallmate-supabase.sql`](database/mallmate-supabase.sql), and click **Run**.
   - This creates the `users`, `shops`, `products`, and `orders` tables and loads initial sample shops & products.
4. Go to **Project Settings** > **Database**:
   - Under **Connection string**, select **JDBC** (or **URI**):
     - **Host**: e.g., `aws-0-ap-south-1.pooler.supabase.com` (use the Session Pooler or direct connection)
     - **Database name**: `postgres`
     - **Port**: `6543` (Pooler) or `5432` (Direct)
     - **User**: `postgres.[your-project-ref]` (or `postgres` if direct)
     - **Password**: your database password

---

### 2. Push to GitHub

1. Initialize git and commit:
   ```bash
   git init
   git add .
   git commit -m "MallMate ready for Supabase & Render deployment"
   ```
2. Create a new repository on [GitHub](https://github.com/new) (e.g. `Mall_Mate_Web`).
3. Link and push to GitHub:
   ```bash
   git remote add origin https://github.com/<your-username>/Mall_Mate_Web.git
   git branch -M main
   git push -u origin main
   ```

---

### 3. Deploy to Render

1. Log in to [Render](https://render.com/).
2. Click **New +** > **Web Service**.
3. Connect your GitHub repository (`Mall_Mate_Web`).
4. Configure service:
   - **Name**: `mallmate`
   - **Environment**: `Docker` (Render automatically uses the included `Dockerfile`)
   - **Region**: Choose the closest region (e.g. `Oregon` or `Frankfurt`)
   - **Branch**: `main`
   - **Instance Type**: `Free`
5. Under **Environment Variables**, add:
   - `DB_URL`: e.g. `jdbc:postgresql://aws-0-ap-south-1.pooler.supabase.com:6543/postgres?sslmode=require`
   - `DB_USER`: your Supabase database user (e.g., `postgres.xxxxxxxxxxxxxx`)
   - `DB_PASSWORD`: your Supabase database password
   *(Or you can simply set `DATABASE_URL` with your Supabase Postgres connection URI)*
6. Click **Create Web Service**.
7. Render will build the Docker container using Maven & Tomcat, automatically bind to Render's port, and deploy your live URL (e.g., `https://mallmate.onrender.com/`).

---

## 💻 Local Development Setup (Optional)

1. **MySQL Local**:
   - Run `database/mallmate.sql` in MySQL Workbench or CLI.
   - Run locally on Tomcat 9 at `http://localhost:8080/mallmate/` or deploy via Maven.
2. **Supabase Local**:
   - Set environment variables `DB_URL`, `DB_USER`, `DB_PASSWORD` before starting Tomcat.