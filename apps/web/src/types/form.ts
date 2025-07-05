export type FormField = {
  name: string;
  label: string;
  type: "text" | "email" | "password" | "select" | "textarea";
  required?: boolean;
  options?: { label: string; value: string }[];
  placeholder?: string;
};

export type FormError = {
  field: string;
  message: string;
};