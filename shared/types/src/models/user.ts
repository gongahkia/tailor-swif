import { UserRole, AccountStatus } from "../enums";

export interface User {
  id: string;
  email: string;
  name: string;
  role: UserRole;
  status: AccountStatus;
  preferredLanguage: string;
  createdAt: string;
  updatedAt: string;
}