[![](https://img.shields.io/badge/tailor_swif_1.0.0-passing-green)](https://github.com/gongahkia/tailor-swif/releases/tag/1.0.0) 

# `Tailor Swif`

Full Stack Web App that connects [tailor](https://dictionary.cambridge.org/dictionary/english/tailor)s and their [client](https://www.reddit.com/r/askSingapore/comments/1cm3f25/affordable_tailor/)s.

Made mainly to learn [this stack](#stack).

## Stack

* *Frontend*: [Next.js](https://nextjs.org/), [TypeScript](https://www.typescriptlang.org/)
* *Backend*: [Phoenix](https://www.phoenixframework.org/), [Elixir](https://elixir-lang.org/), [Ecto](https://hexdocs.pm/ecto/)
* *DB*: [PostgreSQL](https://www.postgresql.org/)
* *Cache*: [Redis](https://redis.io/)
* *Auth*: [Clerk](https://clerk.com/), [JWT](https://jwt.io/introduction), [Bcrypt](https://clerk.com/blog/bcrypt-hashing-authentication-encryption)
* *Deployment*: [AWS EC2](https://aws.amazon.com/ec2/), [AWS RDS](https://aws.amazon.com/s3/), [AWS S3](https://aws.amazon.com/s3/), [Terraform](https://developer.hashicorp.com/terraform), [AWS CloudFormation](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/Welcome.html)
* *Package*: [Docker](https://www.docker.com/)
* *Internationalization*: [next-i18next](https://next.i18next.com/)

## Screenshots

...

## Usage

...

```console
$ git clone https://github.com/gongahkia/tailor-swif && cd tailor-swif
$ make
$ make build
```

`./apps/web/.env.local`

```env
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=XXX
CLERK_SECRET_KEY=XXX
NEXT_PUBLIC_API_BASE_URL=http://localhost:4000
NEXT_PUBLIC_MAPS_API_KEY=XXX
```

`./infra/docker/.env`

```env
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=XXX
CLERK_SECRET_KEY=XXX

NEXT_PUBLIC_API_BASE_URL=http://api:4000
NEXT_PUBLIC_MAPS_API_KEY=XXX

SECRET_KEY_BASE=XXX
S3_BUCKET=XXX

POSTGRES_PASSWORD=XXX
```

## Architecture

![](./asset/reference/architecture.png)

## Reference

The name `Tailor Swif` is in reference to [A$AP Rocky](https://en.wikipedia.org/wiki/ASAP_Rocky)'s 2024 song of the [same name](https://youtu.be/5URefVYaJrA?feature=shared).

![](./asset/logo/tailor-swif.png)

## Takeaways

...

## Legal Disclaimer

...