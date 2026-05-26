export type Question = {
  id: string;
  content: string;
  likes: number;
  created_at: string;
};

export type Answer = {
  id: string;
  question_id: string;
  content: string;
  created_at: string;
};

export type Dislike = {
  id: string;
  question_id: string;
  created_at: string;
};
