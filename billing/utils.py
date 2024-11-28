import asyncio
from concurrent.futures import ThreadPoolExecutor
from django.core.mail import EmailMessage
from django.conf import settings

async def send_mail_async(subject, message, recipient_list, from_email=None, attachments=None):
    """
    Sends an email asynchronously, compatible with Python versions < 3.9.
    """
    from_email = from_email or settings.EMAIL_HOST_USER
    email = EmailMessage(subject, message, from_email, recipient_list)

    # Add attachments if provided
    if attachments:
        for attachment in attachments:
            email.attach(*attachment)

    # Use ThreadPoolExecutor for Python versions < 3.9
    loop = asyncio.get_event_loop()
    with ThreadPoolExecutor() as executor:
        await loop.run_in_executor(executor, email.send)
