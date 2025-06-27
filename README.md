# PS HTTP Simulator Deployment Guide

This guide explains how to set up and deploy the PS HTTP Simulator Docker image, configure it to use your own MySQL database (for example, using filess.io for free), and obtain the correct URL for integration.

## 1. Get Your Database Credentials

First, sign up for a free MySQL database provider, such as [filess.io](https://filess.io/). After creating your database, you will receive a MySQL URI that looks like this:

```
mysql://username:password@hostname:port/dbname
```

- **username**: Your database username
- **password**: Your database password
- **hostname**: The database host address
- **port**: The port (e.g., 3306 or 3307)
- **dbname**: The name of your database

## 2. Configure the Docker Image

Create a folder (with any name) and add a `Dockerfile` with the following content (replace the values with your own database credentials):

```
FROM ghcr.io/perejover/ps-http-sim:latest
CMD ["-listen-port=3900", "-mysql-dbname=YOUR_DBNAME", "-mysql-addr=YOUR_HOSTNAME", "-mysql-port=YOUR_PORT"]
```

## 3. Deploy the Docker Image

You can deploy this Docker image to a free hosting provider, such as [Render](https://render.com/):

1. Upload your folder (with the `Dockerfile`) to a GitHub repository.
2. Go to Render.com and create a new Web Service, connecting it to your GitHub repository.
3. Render will build and deploy your Docker image, and provide you with a public URL, e.g.:
   
   ```
   https://your-app-name.onrender.com
   ```

## 4. Construct the Database URL for Integration

To use this service, you will need to construct a URL that includes your database credentials and the Render URL. The format is:

```
PLANETSCALE_DATABASE_URL="https://username:password@your-app-name.onrender.com"
```

- Use the **username** and **password** from your MySQL URI.
- Use the Render URL as the host.

## Example

Suppose your MySQL URI is:
```
mysql://username:password@example.filess.io:3307/dbname
```

And your Render URL is:
```
https://hostname.onrender.com
```

Your final environment variable would be:
```
PLANETSCALE_DATABASE_URL="https://username:password@hostname.onrender.com"
```

---

**Note:**
- Always keep your database credentials secure.
- You can use any MySQL provider and any Docker hosting service; the steps are similar. 
