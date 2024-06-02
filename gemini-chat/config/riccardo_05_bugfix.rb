
# BUG: [__NSCFConstantString initialize] may have been in progress in another thread when fork() was called #38560

# https://github.com/rails/rails/issues/38560
ENV['OBJC_DISABLE_INITIALIZE_FORK_SAFETY']=yes
