# Home Lab - Raphaël Talleux

This repo is about my personal homelab adventure.
I’m building and running self-hosted services for fun, learning, and to move away from GAFAM.  
If you’re curious about doing the same, feel free to dig in.


## Why?

- **De-GAFAM-ization** → keep control of my data.  
- **Learning** → no black boxes, I want to know how it works.  
- **Customization** → tune stuff the way *I* want.  
- **Pride** → it feels good to build it yourself.  


## Security

In this project, security is non-negotiable. The data passing through the homelab is sensitive.  
I use Docker to isolate services and control external access.  

It is crucial to keep containers that interact with the outside world up to date.  


## What’s inside?

Right now:  

- Mail server (Postfix)  
- IMAP server (Dovecot)  


## Setup

Clone the repo:

```bash
git clone https://github.com/Raphael-Talleux/HomeLab.git
cd HomeLab
```

Then copy the env template:

```bash
cp .env.template .env
```

All config is handled by `.env`.


## Usage

### Launch the containers

To launch the containers with Docker Compose, run the following command:

```bash id="tdzrgy"
docker compose up -d --build
```

### Stop the containers

To stop and remove the containers, use this command:

```bash id="1flhlw"
docker compose down
```


### Virtual User Database

You can access the virtual user database using the **Adminer** container. The default port is **8080**.
Connect via a web browser. Be mindful of port settings if the machine is not on the same network, or in case of a firewall.

Connection examples:

* **Localhost**:

  ```plaintext
  127.0.0.1:8080 or localhost:8080
  ```

* **Local Network**:

  ```plaintext
  192.168.1.45:8080
  ```

### Manage the IMAP server

You can run commands on **Dovecot** via Docker. The easiest way is to get a **bash** shell in the container using Docker EXEC:

```bash id="daxmj7"
docker exec -it homelab-imap-server bash
```

Alternatively, you can directly use Docker EXEC to run Dovecot commands. For example, to test authentication for a user:

```bash id="5uxwc3"
docker exec -it homelab-imap-server doveadm auth test mailuser@host.com
```

I also created a cheatsheet with the most useful **doveadm** commands. [LINK](https://github.com/Raphael-Talleux/CheatSheet/blob/master/Mailing/Dovecot%20Commands.md)


