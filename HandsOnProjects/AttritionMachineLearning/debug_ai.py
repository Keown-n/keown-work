from openai import OpenAI
import os

client = OpenAI(
  base_url="https://openrouter.ai/api/v1",
  api_key="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",
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
