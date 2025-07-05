import { z } from "zod";

export const validateUser = (data: unknown) => {
  const schema = z.object({
    email: z.string().email(),
    name: z.string().min(2),
    password: z.string().min(8),
    preferredLanguage: z.string().min(2)
  });
  return schema.safeParse(data);
};