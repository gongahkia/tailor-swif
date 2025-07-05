export type NavLink = {
  label: string;
  href: string;
  icon?: React.ReactNode;
  requiresAuth?: boolean;
};

export type ModalState = {
  open: boolean;
  title?: string;
  content?: React.ReactNode;
};

export type Theme = "light" | "dark";