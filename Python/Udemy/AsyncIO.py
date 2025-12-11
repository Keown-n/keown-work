import asyncio
from asyncio import Task,Future
from datetime import datetime


async def fetch_data(input_data: int, delay :int) -> dict:
    print('Fetching data...')
    start_time: datetime = datetime.now()
    await asyncio.sleep(delay)
    end_time: datetime = datetime.now()
    print('Data retrieved!')

    return {
        'input': input_data,
        'start_time': f'{start_time:%H:%M:%S}',
        'end_time': f'{end_time:%H:%M:%S}'
    }





async def main() -> None:
    task1: Task[dict] = asyncio.create_task(fetch_data(1,))
   # task2: Task[dict] = asyncio.create_task(fetch_data(2,1))
    await asyncio.sleep(1)
    print('Running.........')

    data1: dict = await task1
   # data2: dict = await task2

    print(f'{data1=}')
   # print(f'{data2=}')


#     task: Task[dict] = asyncio.create_task(fetch_data(2, delay=10))
#     await asyncio.sleep(1)
#     task.cancel(msg='Took too long...')

# try:
#     data: dict = await task    [
#     print(data)
# except asyncio.CancelledError as e:
#     print('Task was cancelled...')
#     print(e)
#     print(task.cancelled())



    tasks: Future[tuple] = asyncio.gather(
        fetch_data(1, delay=1),
        fetch_data(2, delay=2),
        fetch_data(3, delay=1)
    )

    results: tuple = await  tasks
    print(results)

# To run the main function:
asyncio.run(main())