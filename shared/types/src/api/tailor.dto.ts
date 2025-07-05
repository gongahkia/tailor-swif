import { TailorType } from "../enums";

export interface CreateTailorRequest {
  name: string;
  type: TailorType;
  address: string;
  services: string[];
  description: Record<string, string>;
}

export interface TailorResponse {
  id: string;
  name: string;
  type: TailorType;
  address: string;
  latitude: number;
  longitude: number;
  services: string[];
  description: Record<string, string>;
  rating: number;
  reviewCount: number;
  createdAt: string;
  updatedAt: string;
}