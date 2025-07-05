import { ReviewStatus } from "../enums";

export interface CreateReviewRequest {
  tailorId: string;
  rating: number;
  comment: string;
  language: string;
}

export interface ReviewResponse {
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