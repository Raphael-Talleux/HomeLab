# Home Lab - Raphaël Talleux

This repo is about my personal homelab adventure.
I’m building and running self-hosted services for fun, learning, and to move away from GAFAM.  
If you’re curious about doing the same, feel free to dig in.

---

## Why?

- **De-GAFAM-ization** → keep control of my data.  
- **Learning** → no black boxes, I want to know how it works.  
- **Customization** → tune stuff the way *I* want.  
- **Pride** → it feels good to build it yourself.  

In short: build something that works, is fast, and secure — by actually understanding it.

---

## Security

In this project, security is non-negotiable. The data passing through the homelab is sensitive.  
I use Docker to isolate services and control external access.  

It is crucial to keep containers that interact with the outside world up to date.  

---

## What’s inside?

Right now:  

- Mail server (Postfix)  
- IMAP server (Dovecot)  
- Webmail client (Roundcube)  
- Password manager (Vault)  

---

## Setup

Clone the repo:

```bash
git clone
cd HomeLab
```

Then copy the env template:

```bash
cp .env.template .env
```

All config is handled by `.env` (no hardcoding here).

---

## Usage

I’m not writing a Docker tutorial here 😅 — so I assume you already know the basics.  

### Start the mail stack

```bash
docker compose up -d
```

### Send a local mail

```bash
echo "message" | mutt -s "subject" you@example.com
```

---

## About me

Hi, I’m Raphaël.  
I’m passionate about computing, Linux, and breaking free from GAFAM tools.  
For example: replacing Windows with Arch Linux, ditching Google’s suite, and hosting my own stuff.  

I hate not knowing how things work — so I built this project and decided to share it, in case it helps someone else.  



