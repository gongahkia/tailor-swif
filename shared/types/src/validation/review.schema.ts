import { z } from "zod";
import { ReviewStatus } from "../enums";

export const createReviewSchema = z.object({
  tailorId: z.string().uuid(),
  rating: z.number().min(1).max(5),
  comment: z.string().min(1),
  language: z.string().min(2)
});

export const reviewResponseSchema = z.object({
  id: z.string().uuid(),
  tailorId: z.string().uuid(),
  userId: z.string().uuid(),
  rating: z.number(),
  comment: z.string(),
  status: z.nativeEnum(ReviewStatus),
  language: z.string(),
  createdAt: z.string(),
  updatedAt: z.string()
});