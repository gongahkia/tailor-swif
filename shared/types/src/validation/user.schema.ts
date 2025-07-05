import { z } from "zod";
import { UserRole, AccountStatus } from "../enums";

export const createUserSchema = z.object({
  email: z.string().email(),
  name: z.string().min(2),
  password: z.string().min(8),
  preferredLanguage: z.string().min(2)
});

export const userResponseSchema = z.object({
  id: z.string().uuid(),
  email: z.string().email(),
  name: z.string(),
  role: z.nativeEnum(UserRole),
  status: z.nativeEnum(AccountStatus),
  preferredLanguage: z.string(),
  createdAt: z.string(),
  updatedAt: z.string()
});