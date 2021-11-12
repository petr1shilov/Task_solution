def indexs(nums, target):
    for i in range(len(nums)):
        for j in range(len(nums)):
            if nums[i] + nums[j] == target:
                print(i, j)
                nums.pop(i), nums.pop(j)
                






