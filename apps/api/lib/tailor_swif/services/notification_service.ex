defmodule TailorSwif.Services.NotificationService do
  def send_welcome_email(user) do
    email =
      Swoosh.Email.new()
      |> Swoosh.Email.to({user.name, user.email})
      |> Swoosh.Email.from({"Tailor Swif", "noreply@tailorswif.com"})
      |> Swoosh.Email.subject("Welcome to Tailor Swif!")
      |> Swoosh.Email.text_body("Hello #{user.name}, welcome to Tailor Swif.")

    TailorSwif.Mailer.deliver(email)
  end
end