alias TailorSwif.Repo
alias TailorSwif.Schemas.User

users = [
  %{
    email: "admin@tailorswif.com",
    name: "Admin",
    role: "ADMIN",
    status: "ACTIVE",
    preferred_language: "en"
  },
  %{
    email: "customer@tailorswif.com",
    name: "Customer",
    role: "CUSTOMER",
    status: "ACTIVE",
    preferred_language: "en"
  },
  %{
    email: "tailor@tailorswif.com",
    name: "Tailor",
    role: "TAILOR",
    status: "ACTIVE",
    preferred_language: "en"
  }
]

for user <- users do
  Repo.insert!(
    %User{
      email: user.email,
      name: user.name,
      role: user.role,
      status: user.status,
      preferred_language: user.preferred_language
    }
  )
end