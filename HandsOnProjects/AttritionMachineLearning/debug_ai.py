from openai import OpenAI
import os
from dotenv import load_dotenv

load_dotenv()

api_key = os.getenv("OPENROUTER_API_KEY")
if not api_key:
    raise RuntimeError("OPENROUTER_API_KEY is not configured.")

client = OpenAI(
  base_url="https://openrouter.ai/api/v1",
  api_key=api_key,
)

print("Sending request to OpenRouter...")
try:
    response = client.chat.completions.create(
      model="x-ai/grok-4.1-fast:free",
      messages=[
              {
                "role": "user",
                "content": "Say hello."
              }
            ],
      extra_body={"reasoning": {"enabled": True}}
    )
    print("Response received!")
    print("Content:", response.choices[0].message.content)
    print("Reasoning:", getattr(response.choices[0].message, 'reasoning_details', 'No reasoning details'))
except Exception as e:
    print("Error:", e)

