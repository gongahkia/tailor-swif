import { ReviewStatus } from "../enums";

export interface Review {
  id: string;
  tailorId: string;
  userId: string;
  rating: number;
  comment: string;
  status: ReviewStatus;
  language: string;
  createdAt: string;
  updatedAt: string;
}