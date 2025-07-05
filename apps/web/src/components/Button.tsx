import React from "react";

type ButtonProps = React.ButtonHTMLAttributes<HTMLButtonElement> & {
  variant?: "primary" | "secondary";
  children: React.ReactNode;
};

export function Button({ variant = "primary", children, ...props }: ButtonProps) {
  const base =
    "px-4 py-2 rounded font-semibold transition focus:outline-none focus:ring";
  const styles =
    variant === "primary"
      ? "bg-blue-600 text-white hover:bg-blue-700 focus:ring-blue-300"
      : "bg-gray-200 text-gray-800 hover:bg-gray-300 focus:ring-gray-300";
  return (
    <button className={`${base} ${styles}`} {...props}>
      {children}
    </button>
  );
}