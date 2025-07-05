import { UserRole, AccountStatus } from "../enums";

export interface CreateUserRequest {
  email: string;
  name: string;
  password: string;
  preferredLanguage: string;
}

export interface UserResponse {
  id: string;
  email: string;
  name: string;
  role: UserRole;
  status: AccountStatus;
  preferredLanguage: string;
  createdAt: string;
  updatedAt: string;
}