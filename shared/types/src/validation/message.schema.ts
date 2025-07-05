import { z } from "zod";
import { MessageType } from "../enums";

export const sendMessageSchema = z.object({
  threadId: z.string().uuid(),
  recipientId: z.string().uuid(),
  type: z.nativeEnum(MessageType),
  content: z.string().optional(),
  voiceUrl: z.string().url().optional()
});

export const messageResponseSchema = z.object({
  id: z.string().uuid(),
  threadId: z.string().uuid(),
  senderId: z.string().uuid(),
  recipientId: z.string().uuid(),
  type: z.nativeEnum(MessageType),
  content: z.string().optional(),
  voiceUrl: z.string().url().optional(),
  createdAt: z.string(),
  read: z.boolean()
});