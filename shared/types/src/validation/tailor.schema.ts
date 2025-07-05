import { z } from "zod";
import { TailorType } from "../enums";

export const createTailorSchema = z.object({
  name: z.string().min(2),
  type: z.nativeEnum(TailorType),
  address: z.string().min(5),
  services: z.array(z.string()),
  description: z.record(z.string())
});

export const tailorResponseSchema = z.object({
  id: z.string().uuid(),
  name: z.string(),
  type: z.nativeEnum(TailorType),
  address: z.string(),
  latitude: z.number(),
  longitude: z.number(),
  services: z.array(z.string()),
  description: z.record(z.string()),
  rating: z.number(),
  reviewCount: z.number(),
  createdAt: z.string(),
  updatedAt: z.string()
});