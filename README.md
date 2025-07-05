[![](https://img.shields.io/badge/tailor_swif_1.0.0-passing-green)](https://github.com/gongahkia/tailor-swif/releases/tag/1.0.0) 

# `Tailor Swif`

made mainly to learn [this stack](#stack) for . see my takeaways.

## Stack

* *Frontend*: [Next.js](), [TypeScript]()
* *Backend*: [Phoenix](), [Elixir](), [Ecto]()
* *DB*: [PostgreSQL]()
* *Cache*: [Redis]()
* *Auth*: [Clerk](), [Jason](), [Bcrypt]()
* *Deployment*: [AWS EC2](), [AWS RDS](), [AWS S3](), [Terraform](), [CloudFormation]()
* *Package*: [Docker]()
* *Internationalization*: [next-i18next]()

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